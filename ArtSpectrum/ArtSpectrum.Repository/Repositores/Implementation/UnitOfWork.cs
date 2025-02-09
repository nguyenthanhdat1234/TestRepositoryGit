﻿using ArtSpectrum.Models;
using ArtSpectrum.Repository.Repositores.Interface;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtSpectrum.Repository.Repositores.Implementation
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ArtSpectrumDBContext _context;

        internal ArtSpectrumDBContext Context => _context;

        private IBaseRepository<User>? _userRepository;

        public UnitOfWork(ArtSpectrumDBContext context)
        {
            _context = context;
        }

        public IBaseRepository<User> UserRepository => _userRepository ??= new UserRepository(_context);

        public async Task Commit(CancellationToken cancellationToken)
        {
            await _context.SaveChangesAsync(cancellationToken);
        }

        private bool _disposed;

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}
